class SimWorker < ActiveJob::Base
  queue_as :default
  
  def perform(current_user, simulation, progress_bar)
    @progress_bar = progress_bar
    @progress_bar.update_attributes!({
      message: 'Working...',
      percent: 0
    })

    @current_user = current_user
    @simulation = simulation
    if @current_user.admin? then
      sim_owner = User.find {|u| u.id == @simulation.user_id}
      pipeline = Pipeline.find{|p| p.id == @simulation.pipeline_id}
      nomination = Nomination.find{|n| n.id == @simulation.nomination_id}
      commodities = sim_owner.commodities
      units = pipeline.units
      pumpar = sim_owner.pumps
    else
      pipeline = @current_user.pipelines.find{|p| p.id == @simulation.pipeline_id}
      nomination = @current_user.nominations.find{|n| n.id == @simulation.nomination_id}
      commodities = @current_user.commodities
      units = pipeline.units
      pumpar = @current_user.pumps
    end
    if @simulation.run(@progress_bar, pipeline, nomination, commodities, units, pumpar)
      @progress_bar.update_attributes!({
        message: 'Successful Simulation.  You may now view the results.',
        percent: 0
      })
      return true
    else
      @progress_bar.update_attributes!({
        message: 'Failed Simulation - see errors below.',
        percent: 0
      })
      return false
    end    
  end
end