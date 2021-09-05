class TimeEntriesController < ApplicationController
  include Redirectable
  before_action :set_time_entry, only: %i[ edit update destroy ]
  before_action :redirect_not_loggedin_users
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_time_entry

  # GET /time_entries or /time_entries.json
  def index
    #@time_entries = TimeEntry.all
    @time_entries = Current.user.time_entries.all
    #render plain: Current.user.inspect
  end

  # GET /time_entries/new
  def new
    @time_entry = TimeEntry.new
  end

  # GET /time_entries/1/edit
  def edit
  end

  # POST /time_entries or /time_entries.json
  def create
    @time_entry = Current.user.time_entries.build(time_entry_params)

    respond_to do |format|
      if @time_entry.save
        format.html { redirect_to @time_entry, notice: "Time entry was successfully created." }
        format.json { render :show, status: :created, location: @time_entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @time_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_entries/1 or /time_entries/1.json
  def update
    respond_to do |format|
      if @time_entry.update(time_entry_params)
        format.html { redirect_to @time_entry, notice: "Time entry was successfully updated." }
        format.json { render :show, status: :ok, location: @time_entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @time_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_entries/1 or /time_entries/1.json
  def destroy
    @time_entry.destroy
    respond_to do |format|
      format.html { redirect_to time_entries_url, notice: "Time entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_entry
      @time_entry = TimeEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def time_entry_params
      params.require(:time_entry).permit(:comment, :start, :end)
    end


    def invalid_time_entry
      logger.error "Attempt to access invalid time entry #{params[:id]}"
      notice_text = Current.user.present? ? 'Invalid time entry requested' : 'You need to login to access time entries'
      redirect_to time_entries_path, notice: notice_text
    end
end
