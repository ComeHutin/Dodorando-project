Rails.application.routes.draw do

  resources :recaporder
  resources :userprofils, only: [:show]

  devise_for :users, controllers: {
  	omniauth_callbacks: 'users/omniauth_callbacks', confirmations: 'users/confirmations'
  }

  get '/bookingpage',to:'staticpages#bookingpage'
  get '/addroom',to:'staticpages#addroom'
  get '/userprofile',to:'staticpages#userprofile'
  get '/blog',to:'staticpages#blog'
  get '/contact',to:'staticpages#contact'
  get '/bookingpageconfirmation',to:'staticpages#bookingpageconfirmation'
  get '/blogpost',to:'staticpages#blogpost'



  #Used in Host_Dashboard
  get '/host_dashboard_notifications', to:'staticpages#host_dashboard_notifications'
  get '/host_dashboard_my_hostel',to:'staticpages#host_dashboard_my_hostel'
  get '/host_dashboard_my_bedrooms',to:'staticpages#host_dashboard_my_bedrooms'
  get '/host_dashboard_bookings_today',to:'staticpages#host_dashboard_bookings_today'
  get '/host_dashboard_bookings_today_detail',to:'staticpages#host_dashboard_bookings_today_detail'
  get '/host_dashboard_bookings_tomorrow',to:'staticpages#host_dashboard_bookings_tomorrow'
  get '/host_dashboard_bookings_other_date',to:'staticpages#host_dashboard_bookings_other_date'
  get '/host_dashboard_my_profile',to:'staticpages#host_dashboard_my_profile'

  #Unused
  get '/dashboardaddroom',to:'staticpages#dashboardaddroom'
  get '/dashboardbookmarks',to:'staticpages#dashboardbookmarks'
  get '/dashboardinvoice',to:'staticpages#dashboardinvoice'
  get '/dashboardmessages',to:'staticpages#dashboardmessages'
  get '/dashboardmessagesconversation',to:'staticpages#dashboardmessagesconversation'

    

  resources :bedrooms
  resources :orders
  resources :rooms
  resources :dodos
  root "dodos#home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
