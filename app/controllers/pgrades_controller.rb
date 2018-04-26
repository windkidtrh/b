class PgradesController < ApplicationController
    before_action :logged_in_user, only: [:edit,  :update]
    before_action :real_user,      only: [:edit,  :update]

    def edit
    	@point  = Point.find(params[:id])
        @pgrade = Pgrade.find_by(equip_id: @point.equip_id)
    end

    def update
        @pgrade = Pgrade.find(params[:id])
        @equip  = Equip.find_by(id: @pgrade.equip_id)
		sevs    = pgrade_edit_params[:severe_point].to_f
		mins    = pgrade_edit_params[:minor_point].to_f
        if sevs < mins and mins < 1 and sevs > 0 and sevs < 1 and mins > 0
        	@pgrade.update_attributes(pgrade_edit_params)
            flash[:success] = "Pgrade updated"
            redirect_to equip_path(@equip.id)
        else
          flash[:danger] = "请输入正确的格式"
          render 'edit'
        end
    end


    private

        def pgrade_edit_params
            params.require(:pgrade).permit(:severe_point, :minor_point)
        end
end