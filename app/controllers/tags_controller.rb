class TagsController < ApplicationController
  def index
    @tags = ActiveRecord::Base.connection.execute('SELECT * FROM tags')
  end

  def show
    @tag = ActiveRecord::Base.connection.select_one('SELECT * FROM tags WHERE id = '+params[:tag_id])
    @datetimes = Datetime.tagged_with [@tag['name']], :any => true
  end

  def destroy
    ActiveRecord::Base.connection.execute('DELETE FROM tags WHERE id = '+params[:tag_id])
    
    redirect_to(tags_path, :notice => 'Datetime was successfully created.')
  end

end
