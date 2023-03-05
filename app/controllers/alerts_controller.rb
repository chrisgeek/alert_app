class AlertsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_alert, only: %i[show update destroy]

  def index
    @alerts = Alert.all

    json_response(@alerts, 'ok')
  end

  def show
    json_response(@alert)
  end

  def create
    case params[:alert][:type]
    when 'portal_closed'
      @alert = PortalClosed.new(alert_params)
    when 'portal_opened'
      @alert = PortalOpened.new(alert_params)
    else
      json_error_response(@alert)
    end

    if @alert.save
      json_response(@alert, 'created')
    else
      json_error_response(@alert)
    end
  end

  def update
    if @alert.update(alert_params)
      json_response(@alert, 'ok')
    else
      json_error_response(@alert)
    end
  end

  def destroy
    @alert.destroy
  end

  private

  def set_alert
    @alert = Alert.find(params[:id])
  end

  def json_response(resource, status)
    render json: resource, status: status.to_sym
  end

  def json_error_response(resource)
    render json: resource.errors, status: :unprocessable_entity
  end

  def alert_params
    params.require(:alert).permit(:description, :origin, tag: [])
  end
end
