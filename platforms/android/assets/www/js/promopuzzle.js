function promoPuzzle(userId) {
	var self = this;

	self.ServerUrl = ko.observable('http://localhost:3000');
	self.UserId = ko.observable(userId);

    self.Url = function(url, params) {
    	var result = '' + self.ServerUrl() + '/' + url;

    	if (params) {
    		result +=  '?' + $.param(params);
    	}

    	return result;
    };

	self.FetchPuzzles = function() {
		$.ajax({
		    type: "GET",
		    url: self.Url('api/images.json', {user_id: self.UserId()})
		}).done(function(data) {
		   debugger;
		});

	};

};

