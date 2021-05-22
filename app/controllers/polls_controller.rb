class PollsController < ApplicationController
  before_action :set_poll, only: %i[ show edit update destroy ]

  def index
    @polls = Poll.all
  end

  def show
  end

  def new
    @poll = current_user.polls.build
  end

  def edit
  end

  def create
    @poll = current_user.polls.build(poll_params)

    respond_to do |format|
      if @poll.save
        format.html { redirect_to @poll, notice: "Poll was successfully created." }
        format.json { render :show, status: :created, location: @poll }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @poll.update(poll_params)
        format.html { redirect_to @poll, notice: "Poll was successfully updated." }
        format.json { render :show, status: :ok, location: @poll }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @poll.destroy
    respond_to do |format|
      format.html { redirect_to polls_url, notice: "Poll was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_poll
      @poll = Poll.find(params[:id])
    end

    def poll_params
      params.require(:poll).permit(:title, :description, :image, poll_items_attributes:[:id, :name, :description, :image, :_destroy])
    end
end
