# Include hook code here
ActionController::Base.send :include, InPlaceEditing
ActionController::Base.helper InPlaceMacrosHelper