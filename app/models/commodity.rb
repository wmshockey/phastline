class Commodity < ActiveRecord::Base
    belongs_to :user
    before_save :coefficient_calc
    validates :commodity_id, :presence => true
    validates :temp1, :presence => true, numericality: {:greater_than_or_equal_to => 0, :less_than => 60}
    validates :visc1, :presence => true, numericality: {:greater_than_or_equal_to => 0, :less_than => 500}
    validates :temp2, :presence => true, numericality: {:greater_than_or_equal_to => 0, :less_than => 60}
    validates :visc2, :presence => true, numericality: {:greater_than_or_equal_to => 0, :less_than => 500}
    validates :density, :presence => true, numericality: {:greater_than_or_equal_to => 0, :less_than => 2000}
    validates :density_cf, :presence => true, numericality: {:greater_than_or_equal_to => 0, :less_than => 10} 
    validates :vapor, numericality: {:greater_than_or_equal_to => 0, :less_than => 10000}
    validates_uniqueness_of :commodity_id, scope: :user_id
    default_scope { order(user_id: :asc, commodity_id: :asc) }
    require 'phast_utilities'
    include Conversions

  def copy(commodities, commodity)     
    commodity_copy = commodity.dup
    n = 1
    while n <= 100
      new_id = commodity.commodity_id + "copy" + n.to_s
      if commodities.find {|s| s.commodity_id == new_id} then
        n = n + 1
      else
        break
      end
    end
    commodity_copy.commodity_id = new_id
    commodity_copy.save
    return commodity_copy      
  end

  def visccoef(temp1, visc1, temp2, visc2)
# Purpose is to compute the A and B viscosity coefficients used in the ASTM method.
    if visc1 < 0.12 then
      visc1 = 0.12
      puts 'Warning: A viscosity is too low and has been reset to 0.12'
    end
    if visc2 < 0.12 then
      visc2 = 0.12
      puts 'Warning: A Viscosity is too low and has been reset to 0.12'
    end
    if xval(visc1) < -38.0 then
      z1 = visc1 + 0.7
    else
      z1 = zval(visc1)
    end
    if xval(visc2) < -38.0 then
      z2 = visc2 + 0.7
    else
      z2 = zval(visc2)
    end
    loglogz1 = Math.log10(Math.log10(z1))
    loglogz2 = Math.log10(Math.log10(z2))
    logt1    = Math.log10(temp1+273.15)
    logt2    = Math.log10(temp2+273.15)
    acoef    = (loglogz2*logt1 - loglogz1*logt2) / (logt1 - logt2)
    bcoef    = (loglogz2 - loglogz1) / (logt1 - logt2)
    return acoef, bcoef    
  end

  def xval(e)
    xval = -1.47 - 1.84*e - 0.51*e**2
  end

  def zval(v)
    zval = v + 0.7 + Math::E**(xval(v))
  end
    
  def coefficient_calc
    coefs = visccoef(self.temp1, self.visc1, self.temp2, self.visc2)
    self.acoef = coefs[0]
    self.bcoef = coefs[1]
  end
  
  
end
