class CommentsController < ApplicationController
  def create
    uuid = UUID.new
    file_name = params[:image].present? ? uuid.generate : ""
    if params[:image].present?
      client = Aws::S3::Client.new(region: "ap-northeast-1")
      client.put_object(
        bucket: "rails-ebs-template",
        key: file_name, body:
        params[:image].read
      )
    end
    
    if params[:content].present? || file_name
      Comment.create(
        user_id: params[:user_id].to_i,
        room_id: params[:room_id].to_i,
        content: params[:content],
        imageurl: file_name
      )
    end

    

    return redirect_to controller: 'rooms', action: 'show', id: params[:room_id].to_i
  end
end