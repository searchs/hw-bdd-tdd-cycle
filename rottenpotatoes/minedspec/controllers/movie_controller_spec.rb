require 'spec_helper'
require 'rails_helper'
require 'factory_girl_rails'

describe MoviesController do

  describe 'create' do
    fixtures :movies
    before :each do
      @fake_movie = movies(:star_wars_movie)
    end
    it 'should retrieve the right movie from Movie model to update' do
      Movie.should_receive(:find).with(@fake_movie.id.to_s).and_return(@fake_movie)
      put :update, :id => @fake_movie.id, :movie => {:rating => @fake_movie.rating}
    end

  end

  describe 'update' do
    fixtures :movies
    before :each do
      @fake_movie = movies(:star_wars_movie)
    end
    it 'should retrieve the right movie from Movie model to update' do
      Movie.should_receive(:find).with(@fake_movie.id.to_s).and_return(@fake_movie)
      put :update, :id => @fake_movie.id, :movie => {:rating => @fake_movie.rating}
    end

  end


  describe 'destroy' do
    fixtures :movies
    before :each do
      @fake_movie = movies(:star_wars_movie)
    end
    it 'should retrieve the right movie from Movie model to update' do
      Movie.should_receive(:find).with(@fake_movie.id.to_s).and_return(@fake_movie)
      put :update, :id => @fake_movie.id, :movie => {:rating => @fake_movie.rating}
    end

  end


  describe 'find_with_same_director' do
    # fixtures :movies
    # before :each do
    #   @fake_movie = movies(:star_wars_movie)
    # end
    context 'with params[:id]' do

      it "returns movie with details" do
        movie = Movie.create('New Movie Titled')
        get :show, id: 1
        expect(assigns(:movie)).to eq movie
      end
      it "renders the show template" do

      end

    end

    it 'should retrieve the right movie from Movie model to update' do
      movie = FactoryGirl.build(:movie, :title => 'Milky')
      Movie.should_receive(:find).with(@fake_movie.id.to_s).and_return(@fake_movie)
      put :update, :id => @fake_movie.id, :movie => {:rating => @fake_movie.rating}
    end

    it "should include a rating and year" do
      movie = FactoryGirl.build(:movie, :title => 'Casper the Ugly ghost', :director => 'Jack Fisher', :rating => 'PG', :release_date => 1999)

      movie.release_date.should_not null
    end
  end

end
