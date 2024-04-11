# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# Start the Rails Server: First, ensure that the Rails server is running. You can start the server by running the following command in your terminal:

	rails server

# Open Postman: Open the Postman application on your computer.

# Set Up Requests or Import this postman collection(https://www.postman.com/sajjanpatel123/workspace/bowling-game/collection/8886308-99345200-afb4-48fd-a025-5c99331470aa?action=share&creator=8886308).

# Start a New Game:

# Set the request type to POST.
	Enter the URL for starting a new game. For example: http://localhost:3000/games.
	Optionally, you can add any required headers or parameters.
	Click on the "Send" button to send the request.

#Submit a Roll:
	Set the request type to POST.
	Enter the URL for submitting a roll. For example: http://localhost:3000/games/:id/roll, where :id is the ID of the game.
	In the request body, specify the number of pins knocked down. For example, { "pins": 7 }.
	Click on the "Send" button to send the request.

#Get the Game Score:

	Set the request type to GET.
	Enter the URL for getting the game score. For example: http://localhost:3000/games/:id/score, where :id is the ID of the game.
	Click on the "Send" button to send the request.