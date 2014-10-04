angular.module 'birthdayCorkboard'
  .controller 'BirthdayController', ($scope, Birthday) ->

    $scope.birthdays = []

    $scope.month = new Date().getMonth()

    $scope.getMonthName = (month) ->
      switch month
        when 0 then 'January'
        when 1 then 'February'
        when 2 then 'March'
        when 3 then 'April'
        when 4 then 'May'
        when 5 then 'June'
        when 6 then 'July'
        when 7 then 'August'
        when 8 then 'September'
        when 9 then 'October'
        when 10 then 'November'
        when 11 then 'December'

    $scope.getMonthDay = (date) ->
      new Date(parseInt date, 10).getDate()


    changeTitle = ->
      $scope.title = "#{$scope.getMonthName($scope.month)}'s Birthdays"

    changeTitle()

    fetchBirthdays = ->
      $scope.birthdays = Birthday.getBirthdays()
      console.log 'Done assigning'

    $scope.previousMonth = ->
      if $scope.month > 0 
        $scope.month = $scope.month - 1
        changeTitle()
        console.log "Month at #{$scope.month}"

    $scope.nextMonth = ->
      if $scope.month < 11 
        $scope.month = $scope.month + 1
        changeTitle()
        console.log "Month at #{$scope.month}"

    fetchBirthdays()

  .filter 'month', ->
    (birthdays, month) ->
      filtered = []
      for birthday in birthdays
        date = new Date(parseInt birthday.birthday, 10)
        if date.getMonth() == month
          filtered.push birthday
      console.log 'Filtered by month'
      filtered