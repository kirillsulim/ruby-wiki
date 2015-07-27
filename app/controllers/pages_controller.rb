class PagesController < ApplicationController
  def add
    if !@page
      @page = Page.new
    end
  end

  def create
    page = Page.new
    page.name = params[:page][:name]
    page.title = params[:page][:title]
    page.content = params[:page][:content]

    path = params[:path]
    if path
      page.full_name = "#{path}/#{page.name}"
    else
      page.full_name = page.name
    end
    page.save

    @page = page
    if page.valid?
      redirect_to action: 'view', path: page.full_name
    else
      render 'add'
    end
  end

  def edit
    @page = Page.find_by name: params[:path]
  end

  def update
    page = Page.find_by name: params[:path]
    page.update_attributes(page_params)
    page.save

    redirect_to action: 'view'
  end

  def view
    path = params[:path]
    if path
      @page = Page.find_by(full_name: path) or not_found
      @pages = []
    else
      @page = nil
      @pages = Page.all()
    end
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
