class PagesController < ApplicationController
  def add
    # Check if parent page exist
    path = params[:path]
    if path
      Page.find_by(full_name: path) or not_found
    end
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
      parent = Page.find_by(full_name: path) or not_found
      page.full_name = "#{path}/#{page.name}"
      page.parent = parent
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
    @page = Page.find_by(full_name: params[:path]) or not_found
  end

  def update
    page = Page.find_by(full_name: params[:path]) or not_found
    page.title = params[:page][:title]
    page.content = params[:page][:content]
    page.save

    redirect_to action: 'view', path: page.full_name
  end

  def view
    path = params[:path]
    if path
      @page = Page.find_by(full_name: path) or not_found
      @pages = [@page.descendants.arrange]
    else
      @page = nil
      @pages = []
      Page.roots.each do |root|
        @pages.push(root.subtree.arrange)
      end
    end
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
