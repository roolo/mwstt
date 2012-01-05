class TagsController < ApplicationController
  before_filter :require_user

  def index
    @tags = current_user.owned_tags
  end

  def show
    @tag = ActiveRecord::Base.connection.select_one(
        ' SELECT tg.id, tg.name
          FROM tags tg
            INNER JOIN taggings tgg ON tgg.tag_id = tg.id AND tagger_id = '+ current_user.id.to_s() +'
          WHERE tg.id = '+params[:tag_id]
    )

    raise ActiveRecord::RecordNotFound if @tag.nil?

    @datetimes = current_user.datetimes.tagged_with [@tag['name']], :any => true
  end

  def destroy
    ActiveRecord::Base.connection.execute(
        ' DELETE FROM tags
          WHERE id = (
            SELECT tg.id
            FROM tags tg
              INNER JOIN taggings tgg ON tgg.tag_id = tg.id AND tagger_id = '+ current_user.id.to_s() +'
            WHERE tg.id = '+params[:tag_id]+'
            LIMIT 1
          )
        '
    )

    redirect_to(tags_path, :notice => 'Tag was successfully destroyed.')
  end

end
