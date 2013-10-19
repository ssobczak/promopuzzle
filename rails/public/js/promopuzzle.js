function PromoPuzzle(serverUrl, userId) {
	var self = this;

	self.ServerUrl = ko.observable(serverUrl);
	self.UserId = ko.observable(userId);

    self.Url = function(url, params) {
    	var result = '' + self.ServerUrl() + '/' + url;

    	if (params) {
    		result +=  '?' + $.param(params);
    	}

    	return result;
    };

	self.ShowPuzzles = function() {
		$.ajax({
		    type: "GET",
		    url: self.Url('api/images.json', {user_id: self.UserId()})
		}).done(function(data) {
		   debugger;
		   	var viewModel = new imagesViewModel();
		   	viewModel
		   	self.ToStage(viewModel, )

		});
	};


	self.ToStage = function(model, name) {
		var stageHtml = $('.purgatory').find('.' + name).html();
		$('.app').html(stageHtml);

		ko.applyBindings(model, $('.app')[0]);
	};




};


function ImagesViewModel(){
	var self = this;

	self.Init = function(imagesJson) {
		
	};
};


function strona() {
	var self = this;

	self.Text = ko.observable('TEST strony');
};

