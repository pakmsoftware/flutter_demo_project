Flutter Demo Project README

Used API: dummyjson.com (Products and Users collections)
Working credentials :
    username: kminchelle
    password: 0lelplR

Use above credentials for registration as well as others will return 401 from API as dummyjson does not add custom users to its server
Alternatively, uncomment working credentials in models.Users.toLoginJson function

Local Storage: Isar
To check locally stored data open Isar inspector - on app startup you should see in console URL to your local inspector - just open it and you should see following scehmas:
- User - information about user including JWT token - no password stored in the storage
- ProductCache - information about used search as cacheKey (page number and page size information) and list of product ids that can be retrieved from Products schema
- Products - stores products from API calls
When retriving products, app calls cache (Isar) first (if useCache flag is on) to check if there are results stored there with specific page number and page size query.
Then it returns cache results or calls API if cache does not contain results. After API is called cache is updated with results

Search toolbar searches products from already returned products which is a simplified solution. 
With more time and furhter improvement,it can be changed to search products by API or/and use cache for queried searches.

Refresh button (top-right part of screen) clears product isar storage (ProductCache and Products) and calls API again to get fresh results
Sign out button (top-right part of screen) clears all Isar schemas and redirects user to the HomeScreen

Product list shows following information about single product:
- first image
- title
- category
- price

Product details (from list API call; no seperate details API call which can be a development in future for requesting less/more info from API) show following information about product:
- images in CarouselSlider (carousel_slider)
- rank in star icon
- title on appbar and below image (left)
- category and brand above title
- price below images on right side
- discount percentage next to price
- stock below price
- description below Divider

App contains following layers that communicatie with each other:
Widgets (UI) - Change Notifiers(Providers) - Services - dummyjson API client/Isar repository - Data source (API, Isar)

Used get_it and get_it_mixin for singleton and state management (get_it_mixin with change notifiers classes)

There are some unit tests for api client classes and services with mocks but not all as the logic in tests would use mostly the same mocking and asserting
which is overkill for this DEMO project and for reviewing time
Hierarchy of folders and files is the same in test as in lib folders

Widget tests are under:
    test\widgets
    test\screens
Unit tests are under:
    test\apis
    test\db
    test\models
    test\services
    test\utils