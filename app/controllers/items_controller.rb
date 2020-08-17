class ItemsController < ApplicationController
  root 'items#index'
  resourse :items
end