require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  let(:student) { build(:student) }
  let(:valid_attrs) { attributes_for(:student) }
  let(:students) { create_list(:student, 4) }

  context '#index' do
    before(:each) { get :index }

    it 'assigns students' do
      expect(assigns(:students)).to match_array(students)
    end

    context 'rendering' do
      render_views

      it 'renders the view' do
        expect(response).to render_template(:index)
      end
    end
  end

  context '#new' do
    before(:each) { get :new }

    it 'assigns student to a new Student' do
      expect(assigns(:student)).to be_a_new(Student)
    end

    context 'rendering' do
      render_views

      it 'renders the view' do
        expect(response).to render_template(:new)
      end
    end
  end

  context '#create' do
    context 'success' do
      it 'increases student count' do
        expect do
          post :create, student: valid_attrs
        end.to change(Student, :count).by(1)
      end

      it 'redirects to students#index' do
        post :create, student: valid_attrs

        expect(response).to redirect_to students_path
      end
    end
  end
end
