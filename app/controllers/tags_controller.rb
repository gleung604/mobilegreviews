class TagsController < ApplicationController

  def show
    unless Tag.where(name: params[:name]).empty?
      @tag = Tag.where(name: params[:name]).first
    end
  end
end
