class ServiceAttachmentsController < ApplicationController
  before_action :set_service_attachment, only: [:show, :edit, :update, :destroy]

  # GET /service_attachments
  # GET /service_attachments.json
  def index
    @service_attachments = ServiceAttachment.all
  end

  # GET /service_attachments/1
  # GET /service_attachments/1.json
  def show
  end

  # GET /service_attachments/new
  def new
    @service_attachment = ServiceAttachment.new
  end

  # GET /service_attachments/1/edit
  def edit
  end

  # POST /service_attachments
  # POST /service_attachments.json
  def create
    @service_attachment = ServiceAttachment.new(service_attachment_params)

    respond_to do |format|
      if @service_attachment.save
        format.html { redirect_to @service_attachment, notice: 'Service attachment was successfully created.' }
        format.json { render :show, status: :created, location: @service_attachment }
      else
        format.html { render :new }
        format.json { render json: @service_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_attachments/1
  # PATCH/PUT /service_attachments/1.json
  def update
    respond_to do |format|
      if @service_attachment.update(service_attachment_params)
        format.html { redirect_to @service_attachment, notice: 'Service attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_attachment }
      else
        format.html { render :edit }
        format.json { render json: @service_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_attachments/1
  # DELETE /service_attachments/1.json
  def destroy
    @service_attachment.destroy
    respond_to do |format|
      format.html { redirect_to service_attachments_url, notice: 'Service attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_attachment
      @service_attachment = ServiceAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_attachment_params
      params.require(:service_attachment).permit(:service_id, :picture)
    end
end
