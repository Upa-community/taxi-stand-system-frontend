<script>
import { Line } from 'vue-chartjs'

export default {
    extends: Line,
    data(){
        return {
            chartdata: {
                labels: [],
                datasets: []
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
            }
        }
    },
    computed: {
        getHomeData: function() {
            return this.$store.getters["homeData/getHomeData"];
        }
    },
    watch: {
        getHomeData(values) {
            this.chartdata = {labels: [], datasets: []};
            this.chartdata.labels = values.day_labels_data;
            var spots = values.spots_data;

            for (var i = 0; i < spots.length; i++) {
                const dataset = {
                    label: spots[i].spots_name,
                    data: spots[i].spots_day_count,
                    borderColor: spots[i].border_color,
                    lineTension: 0,
                    borderWidth: 3,
                    fill: false
                }
                this.chartdata.datasets.push(dataset);
                this.renderChart(this.chartdata, this.options);
            }
        }
    }
}
</script>