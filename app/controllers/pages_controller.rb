class PagesController < ApplicationController
  def add
  end

  def create
  end

  def edit
  end

  def update
  end

  def view
    @path = params[:path].split('/')
    @pages = Page.all
  end
end
