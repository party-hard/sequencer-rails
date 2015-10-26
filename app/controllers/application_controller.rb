class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  def index
    render file: 'public/index.html'
  end

  def show
    render template: 'layouts/application', layout: false
  end

  private

  def current_user
    @current_user ||= User.find_by(uid: session[:user_id])
  end

  def login_required(options = nil)
    current_user ? true : auth_links
  end

  def not_found
    raise ActiveRecord::RecordNotFound.new('Not Found')
  end

  def auth_links
    @auth_links= {
      login: [
        { name: 'Twitter', url: login_path(:twitter) },
        { name: 'Facebook', url: login_path(:facebook) },
        { name: 'Google', url: login_path(:google) },
        { name: 'LinkedIn', url: login_path(:linkedin) }
      ]
    }
    render status: 404, json: @auth_links
  end

  def items_by_type
    if params.has_key? :type
      @items = case params[:type]
        when 'track'
          @items.where(track: :true)
        when 'pattern'
          @items.where(track: :false)
      end
    end
  end

  def less_items
    @number_of_items = @items.length
    page = params.has_key?(:p) ? params[:p].to_i : 0
    if params.has_key? :n
      number = params[:n].to_i
      if (page > 0); page -= 1 end
      @items = (number != 0) ? @items[page*number..page*number+number-1] : []
    end
  end

  def items_sort
    if params.has_key? :sort
      if params.has_key? :order
        @items = case params[:order]
          when 'asc', 'a', 'az'
            @items.sort_by {|i| i[params[:sort]]}
          when 'desc', 'd', 'za'
            @items.sort_by {|i| i[params[:sort]]}.reverse
          end
      else
        @items = @items.sort_by {|i| i[params[:sort]]}
      end
    end
  end

  helper_method :current_user, :not_found, :auth_links, :items_by_type, :items_sort, :less_items

end
