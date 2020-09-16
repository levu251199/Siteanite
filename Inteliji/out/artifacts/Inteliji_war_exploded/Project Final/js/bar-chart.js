function barchart() {

    var chart = new CanvasJS.Chart("chartContainer", {
        animationEnabled: true,
        title:{
            text: "- Profit and Capital -"
        },
        axisY: {
            title: "Profit",
            titleFontColor: "#4F81BC",
            lineColor: "#4F81BC",
            labelFontColor: "#4F81BC",
            tickColor: "#4F81BC"
        },
        axisY2: {
            title: "Capital",
            titleFontColor: "#C0504E",
            lineColor: "#C0504E",
            labelFontColor: "#C0504E",
            tickColor: "#C0504E"
        },
        toolTip: {
            shared: true
        },
        legend: {
            cursor:"pointer",
            itemclick: toggleDataSeries
        },
        data: [{
            type: "column",
            name: "Profit (trieu vnd)",
            legendText: "Profit in month",
            showInLegend: true,
            dataPoints:[
                { label: "Jan", y: 25 },
                { label: "Feb", y: 30 },
                { label: "Mar", y: 15 },
                { label: "Apr", y: 14 },
                { label: "May", y: 10 },
                { label: "June", y: 22 },
                { label: "July", y: 30 },
                { label: "Aug", y: 32 },
                { label: "Sep", y: 35 },
                { label: "Oct", y: 38 },
                { label: "Nov", y: 40 },
                { label: "Dec", y: 37 }

            ]
        },
            {
                type: "column",
                name: "Capital (trieu vnd)",
                legendText: "Capital in month",
                axisYType: "secondary",
                showInLegend: true,
                dataPoints:[
                    { label: "Jan", y: 15 },
                    { label: "Feb", y: 10 },
                    { label: "Mar", y: 10 },
                    { label: "Apr", y: 10 },
                    { label: "May", y: 5 },
                    { label: "June", y: 12 },
                    { label: "July", y: 15 },
                    { label: "Aug", y: 38 },
                    { label: "Sep", y: 39 },
                    { label: "Oct", y: 28 },
                    { label: "Nov", y: 30 },
                    { label: "Dec", y: 30 }
                ]
            }]
    });
    chart.render();

    function toggleDataSeries(e) {
        if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
            e.dataSeries.visible = false;
        }
        else {
            e.dataSeries.visible = true;
        }
        chart.render();
    }

}