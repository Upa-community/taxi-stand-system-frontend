<template>
    <v-card
        class="mx-auto"
        max-height="420"
    > 
        <v-card-item>
            <v-card-title class="headline">Congestion chart</v-card-title>
            <div class="d-flex justify-center size">
                <v-progress-circular
                    :size="120"
                    :width="10"
                    :value="88"
                    :color="'rgba(255, 0, 0, 60)'"
                    :styles="chartStyles"
                >
                    88%
                </v-progress-circular>                
            </div>
        </v-card-item>
    </v-card>            
</template>
  
<script>
export default {
    data() {
        return{
            height: 100
        }
    },
    computed:{
        chartStyles() {
            return{
                height: `${this.height}%`,
                position:'relative'
            }
        }
    }
}
</script>

<style scoped>
.size{
    height: 350px;
}
</style>
