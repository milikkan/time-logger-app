class TimeEntriesController < ApplicationController
  include Redirectable
  before_action :set_time_entry, only: %i[ show edit update destroy ]
  before_action :set_all_time_entries
  before_action :redirect_not_logged_in_users
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_time_entry

  # GET /time_entries
  def index
    @timer = TimeEntry.new
  end

  # GET /time_entries/1
  def show
  end

  # GET /time_entries/new
  def new
    @time_entry = TimeEntry.new
  end

  # GET /time_entries/1/edit
  def edit
  end

  # POST /time_entries
  def create
    @time_entry = Current.user.time_entries.build(time_entry_params)

    respond_to do |format|
      if @time_entry.save
        format.html { redirect_to last_page, notice: "New time entry created."}
        #format.js
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /time_entries/1
  def update
    respond_to do |format|
      format.html {
        if @time_entry.update(time_entry_params)
          redirect_to time_entries_path, notice: "Time entry updated."
        else
          render :edit
        end
      }
    end
  end

  # DELETE /time_entries/1
  def destroy
    @time_entry.destroy
    redirect_to last_page, notice: "Time entry deleted."
  end

  private
    def set_time_entry
      @time_entry = TimeEntry.find(params[:id])
    end

    def time_entry_params
      params.require(:time_entry).permit(:comment, :start, :stop, :category_id)
    end

    def set_all_time_entries
      @time_entries = TimeEntry.where(user_id: Current.user.id).paginate(page: params[:page], per_page: 10).order('created_at ASC')
    end

    def last_page
      last_page = @time_entries.total_pages
      time_entries_path(page: last_page)
    end

    def invalid_time_entry
      logger.error "Attempt to access invalid time entry #{params[:id]}"
      notice_text = Current.user.present? ? 'Invalid time entry requested' : 'You need to login to access time entries'
      redirect_to time_entries_path, notice: notice_text
    end
end
