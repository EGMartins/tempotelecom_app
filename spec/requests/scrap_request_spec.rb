require 'rails_helper'

RSpec.describe TasksController, type: :request do
  describe 'GET #index' do
    it 'returns http success' do
      get '/tasks'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    before { get "/tasks/#{task.id}" }
    let(:task) { Task.create(name: 'Test task', description: 'Lorem ipsum dolor sit amet') }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns the requested task to @task' do
      expect(assigns(:task)).to eq(task)
    end
  end

  describe 'GET #new' do
    before { get '/tasks/new' }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns a new task to @task' do
      expect(assigns(:task)).to be_a_new(Task)
    end
  end

  describe 'GET #edit' do
    before { get "/tasks/#{task.id}/edit" }
    let(:task) { Task.create(name: 'Test post', description: 'Lorem ipsum dolor sit amet') }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns the requested task to @task' do
      expect(assigns(:task)).to eq(task)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new task' do
        expect do
          post '/tasks', task: {
            name: 'New task',
            description: 'Lorem ipsum dolor sit amet'
          }
        end.to change(Task, :count).by(1)
        expect(response).to redirect_to(Task.last)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new task' do
        expect do
          post '/tasks', task: { name: nil, description: 'Lorem ipsum dolor sit amet' }
        end.to_not change(Task, :count)
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH #update' do
    let(:task) { Task.create(name: 'Test task', description: 'Lorem ipsum dolor sit amet') }

    context 'with valid attributes' do
      before { patch "/tasks/#{task.id}", task: { name: 'Updated task' } }

      it 'updates the task' do
        expect(task.reload.name).to eq('Updated task')
      end

      it 'redirects to the updated task' do
        expect(response).to redirect_to(task)
      end
    end

    context 'with invalid attributes' do
      before { patch "/tasks/#{task.id}", task: { name: nil } }

      it 'does not update the task' do
        expect(task.reload.name).to eq('Test task')
      end

      it 're-renders the edit method' do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:task) { Task.create(name: 'Test task', description: 'Lorem ipsum dolor sit amet') }

    it 'deletes the task' do
      expect do
        delete "/tasks/#{task.id}"
      end.to change(Task, :count).by(-1)
      expect(response).to redirect_to(tasks_path)
    end
  end

  describe 'GET #create_random_task' do
    it 'creates a new task' do
      expect do
        get '/tasks/create_random_task'
      end.to change(Task, :count).by(0)
      expect(response).to redirect_to(tasks_path)
    end
  end
end
