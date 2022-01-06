class ImagesController < ApplicationController
  before_action :load_imageable
  def index
    @image=@imageable.images
  end

  def show
  end
  private
    def load_imageable
      resource,id= request.path.split('/')[1,2] #/physician/id
      @imageable= resource.singularize.classify.constantize.find(id) 
    end
    # def load_imageable
    #   klass= [Physician,Article].detect{ |c| params["#{c.name.underscore}_id"]}
    #   @commentable= klass.find(params["#{klass.name.underscore}_id"])
    # end
end
