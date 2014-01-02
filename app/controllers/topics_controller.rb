class TopicsController < ApplicationController
  def show
    @topic = Topic.find(params[:id])
    @ms = @topic.messages
        
    if params[:messages]
      @message = Message.new(user_id: current_user[:id],
                              topic_id: params[:id],
                              content: params[:messages][:content])
      if @message.save!
        flash[:success] = "回复成功"
      end 
    end
  end
  
  def new_messages
    
  end
end
