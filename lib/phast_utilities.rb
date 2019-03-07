module Conversions

    def convert_to_si(val, unit_abbr)
#     Conversion factors - US to SI metric
  	  blhr_m3hr = 0.15898251       #{conversion from bl/hr to m3/hr}
  	  bldy_m3hr = 0.00662427       #{conversion from bl/dy to m3/hr}
  	  gpm_m3hr = 0.2271253         #{conversion from gpm to m3/hr}
  	  bl_m3 = 0.15898251       	  #{conversion from bl to m3}
  	  psig_kpa = 6.8944            #{conversion from psig to kpa}
  	  mile_km = 1.60934           #{conversion from miles to km}
  	  in_m = 0.0254           	    #{conversion from in to m}
  	  ft_m = 0.3048           	    #{conversion from ft to m}
  	  s_cst = 100				          #{conversion from stokes to centistokes}
#     metric SI to metric SI
      m3dy_m3hr = 0.04166666       #{conversion from m3/dy to m3/hr}
      mm_m = 0.001				          #{conversion from millimeters to meters}
      # Universal Gravitational Constant
      $Gconstant = 0.00980652       # Gravitational constant (km/sec2)
#     Convert value to SI metric which is used for all internal calculations 
      case unit_abbr 
      when "bbls" then
        return val * bl_m3
      when "m3"
        return val
      when "m3/day"
        return val * m3dy_m3hr
      when "bbls/day" 
        return val * bldy_m3hr
      when "bbls/hr" 
        return val * blhr_m3hr
      when "m3/hr" 
        return val
      when "gal/min" 
        return val * gpm_m3hr
      when "psi" 
        return val * psig_kpa
      when "kpa"
        return val
      when "mile" 
        return val * mile_km
      when "km"
        return val
      when "in" 
        return val * in_m
      when "ft" 
        return val * ft_m
      when "Stokes" 
        return val * s_cst
      when "cst"
        return val
      when "mm"
        return val * mm_m
      when "m"
        return val
      when "degAPI"
    		sg = 141.5 / (val + 131.5)
    		return sg * 1000.0
      when "SpecGrav"
        return val * 1000.0
      when "kg/m3"
        return val
      when "C"
        return val
      when "F"
        return (val - 32) * 5.0/9.0
      else
        @pipeline.errors.add(:base, "Invalid unit abbreviation #{unit_abbr} was specified in the input data.")
        return 0
      end        
    end

    def convert_from_si(val, unit_abbr)
#	     metric SI to US
  	   m3hr_m3dy = 24.0            #{conversion from m3/hr to m3/dy}
  	   m3hr_blhr = 6.29            #{conversion from m3/hr to bl/hr}
  	   m3hr_bldy = 150.960030      #{conversion from m3/hr to bl/dy}
  	   m3hr_gpm = 4.40285604       #{conversion from m3/hr to gpm}
  	   m3_bl = 6.29             	 #{conversion from m3 to bl}
  	   kpa_psig = 0.14504525       #{conversion from kpa to psig}
  	   km_miles = 0.62137274       #{conversion from km to miles}
  	   m_in = 39.3700787       	  #{conversion from m to in}
  	   m_ft = 3.28083989       	  #{conversion from m to ft}
  	   cst_S = 0.01				        #{conversion from cst to Stokes}
       kw_hhp = 1.34102204        #{conversion from power in kilowatts to hydraulic horsepower}
       kwh_ftlbs = 2655224.0      #{conversion from energy in kwh to ft-bls}
# Convert value from SI metric to user preferred display units
       case unit_abbr
       when "bbls"
         return val * m3_bl
       when "m3"
         return val
       when "m3/hr"
         return val
       when "m3/day"
         return val * m3hr_m3dy
       when "bbls/day"
         return val * m3hr_bldy
       when "bbls/hr"
         return val * m3hr_blhr
       when "gal/min"
         return val * m3hr_gpm
       when "psi"
         return val * kpa_psig
       when "kpa"
         return val
       when "km"
         return val
       when "mile"
         return val * km_miles
       when "m"
         return val
       when "ft"
         return val * m_ft
       when "in"
         return val * m_in
       when "hhp"
         return val * kw_hhp
       when "kw"
         return val
       when "ft-lbs"
         return val * kwh_ftlbs
       when "kwh"
         return val
       else
         @pipeline.errors.add(:base, "Invalid unit appreviation #{unit_abbr} was specified in the input data.")
         return 0
       end
    end  
    
end