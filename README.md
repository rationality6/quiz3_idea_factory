Build a web application with Ruby on Rails that enable users to share ideas and get people to join the ideas and like the ideas as per the wireframe below.

Here is the requirements and respective score:

Implement CRUD for ideas with user authentication integrated. The user must be signed in do anything but viewing list of ideas and a single idea details. The idea must be associated with the currently logged in user and show their name with the ideas listing. (25%)
Implement the ability to Like an idea as shown below. Users can't like their own ideas. Show the number of likes on the idea show page and the listing page. (25%)
Implement the ability to join an idea (become a member of the idea). The show page of an idea should list the names of all the member of the idea. Users can't join their own ideas. The listings page should show the number of members of that idea. (15%)
Add the ability to create and delete comments on an idea (on the idea show page) with RSpec tests (20%). The tests should take into account the following:
Users must be logged in to create or delete comments
Creating or deleting comments redirects back to the idea show page
Comments get associated with the logged in user
Users can only delete their own comments
[Bonus] idea owners can delete any comments on their ideas (+5%)
Javascript Questions (not part of the app above):
Visit this page http://vancouver.craigslist.ca and write a piece of jQuery code that changes all the links on the home page to have a color red if the link's anchor text includes the pattern eal (5%)

Visit a Wikipedia page like this one: https://en.wikipedia.org/wiki/Rule_of_three_(computer_programming) then write a peice of jQuery code that will fadeOut any link you click on without following the link. (5%)

Write a Javascript code to do the following: Implement filter function in Javascript (5%)

var isEven = function (x) { return x % 2 == 0; }; filter([1, 2, 3, 4], isEven); // => [2, 4]
Bonus (to be added to the Rails application):
Add ability to attach images to ideas (use the Paperclip or CarrierWave gems) - 10%
Add a mailer to send an email to the idea creator when someone likes their ideas and make it happen in the background with DelayedJob - 15%
