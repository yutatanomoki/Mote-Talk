class Public::RoomsController < ApplicationController
  def index
    room_ids = current_user.user_rooms.pluck(:room_id)
    user_ids = UserRoom.where(room_id: room_ids).where.not(user_id: current_user.id).pluck(:user_id)
    @messages = Message.where(user_id: user_ids).order(created_at: :desc).group(:user_id)
  end

  def show
    @instructor = Instructor.find(params[:id])
    # 相手A
    @user = User.find(params[:id])
    # 自分(current_user)の中間テーブル(entry)を全て取り出しpluckメソッドで:room_idを配列にしたものがroom。この時点では相手A以外の人との中間テーブル(entry)も含まれる
    rooms = current_user.user_rooms.pluck(:room_id)
    # user_id:が相手Aでroom_idが roomsのもの（自分との部屋）を取り出す（これが自分と相手Aとの部屋）
    user_room = UserRoom.find_by(user_id: @user.id, room_id: rooms)
    if user_room.nil?
      # 自分と相手Aとの部屋がまだなければ新たに作成し保存。同時に中間テーブルを自分用と相手A用にそれぞれ作る
      @room = Room.create
      UserRoom.create(user_id: current_user.id, room_id: @room.id)
      UserRoom.create(user_id: @user.id, room_id: @room.id)
    # 自分と相手Aとの部屋が既にあれば@roomに既にあるroomを代入
    else
      @room = user_room.room
    end
    # dmを新規作成
    @dm = Message.new(room_id: @room.id)
    # 自分と相手Aとの部屋のdmの全て
    @dms = @room.messages
  end
end
