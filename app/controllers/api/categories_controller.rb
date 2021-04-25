class Api::CategoriesController < ApplicationController
  def index

    render 'index.json.jb'
  end
end
