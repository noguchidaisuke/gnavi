$('.star-rating').raty({
    path: '',
    readOnly: true,
    score: function() {
        return $(this).attr('data-score');
    }
});