class Polls::VotesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_poll
    before_action :set_poll_item

    def create
        @poll_item.votes.where(user_id: current_user.id).first_or_create

        respond_to do |format|
            format.html { redirect_to @poll }
            format.js
        end
    end

    def destroy
        @poll_item.votes.where(user_id: current_user.id).destroy_all

        respond_to do |format|
            format.html { redirect_to @poll }
            format.js
        end
    end

    private

    def set_poll
        @poll = Poll.find(params[:poll_id])
    end

    def set_poll_item
        @poll_item = PollItem.find(params[:poll_item_id])
    end
end