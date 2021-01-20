# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :set_message, only: %i[destroy]
  before_action :authenticate_user!, only: %i[index]

  def index
    @messages = current_user.messages.order(created_at: :desc)
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to user_url(id: @message.user.id)
    else
      render :new
    end
  end

  def destroy
    @message.destroy
    redirect_to user_messages_url
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.permit(:content, :user_id)
  end
end
