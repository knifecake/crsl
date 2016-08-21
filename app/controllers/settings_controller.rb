class SettingsController < ApplicationController
  # PUT/PATCH
  def update
    @settings = current_user.settings

    respond_to do |f|
      if @settings.update(settings_params)
        f.html { redirect_to edit_user_registration_path(current_user), notice: 'Settings updated successfully.' }
        f.json { render json: @settings, status: :ok }
      else
        f.html { redirect_to edit_user_registration_path(current_user), alert: 'Could not update settings: ' + @settings.errors.full_messages.join('. ') }
        f.json { render json: @settings.errors, status: :unprocessable_entity }
      end
    end
  end

  protected
  def settings_params
    params.require(:settings).permit(:display_orientation, :carousel_speed)
  end
end
