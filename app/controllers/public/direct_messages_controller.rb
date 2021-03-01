class Public::DirectMessagesController < ApplicationController
  def create
    # JSファイルに渡しているため「@」は必要
    @dm = current_user.messages.new(dm_params)
    if @dm.save

    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def dm_params
    params.require(:message).permit(:message, :room_id)
  end
end
