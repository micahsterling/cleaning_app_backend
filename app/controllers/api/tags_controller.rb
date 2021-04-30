class Api::TagsController < ApplicationController
  def index
    @tags = Tag.all.sort_by{|tag| tag[:name]}
    render 'index.json.jb'
  end
end

