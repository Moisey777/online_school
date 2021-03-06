class Admin::LessonsController < Admin::BaseController
	skip_before_action :set_active_main_menu_item, only: :sort
	

	before_action :set_course, except: :sort
  before_action :set_lesson, only: [:edit, :update, :destroy]
  def index
    @lessons = @course.lessons.order(:position).page(params[:page])
  end

  def new
    add_breadcrumb "Новое Занятие", [:new, :admin, @course, :lesson]
    @lesson = @course.lessons.build
  end

  def create
    @lesson = @course.lessons.build(lesson_params)

    if @lesson.save
      redirect_to [:admin, @course, :lessons], notice: 'Занятие успешно создано'
    else
      add_breadcrumb "Новое Занятие", [:new, :admin, @course, @lesson]
      flash.now[:alert] = 'Не удалось создать Занятие'
      render :new
    end
  end

  def edit
    add_breadcrumb "Редактировать #{@lesson.name}", [:edit, :admin, @course, :lesson]
  end

  def update
    if @lesson.update(lesson_params)
      redirect_to [:admin, @course, :lessons], notice: 'Занятие успешно отредактировано'
    else
      add_breadcrumb "Редактировать #{@lesson.name}", [:edit,:admin, @course, @lesson]      
      flash.now[:alert] = 'Не удалось отредактировать Занятие', [:admin, @lesson]
      render :edit
    end
  end

  def destroy
    if @lesson.destroy
      redirect_to [:admin, @course, :lessons], notice: 'Занятие успешно удалено'
    else  
      redirect_to [:admin, @course, :lessons], alert: 'Не удалось удалить Занятие' 
    end   
  end

  def sort
    Lesson.reorder(params[:lesson])
    
    head :no_content
  end

  private

  def set_course
  	@course = Course.find(params[:course_id])

  	add_breadcrumb "Курсы", :admin_courses_path

  	add_breadcrumb @course.name, [:admin, @course, :lessons]
  end

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def set_active_main_menu_item                                                                                                                                                                                                                                                                                                                             
    @main_menu[:courses][:active] = true
  end

  def lesson_params
    params.require(:lesson).permit(:name,:description)
  end
end

