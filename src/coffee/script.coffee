# AsyncComputed = require 'vue-async-computed'
# Vue.use AsyncComputed

Vue.component 'ul-comp', 
  props: ['ulData']
  template: 
    '<ul v-if="ulData" class="nav nav-pills nav-stacked">
      <li class="active">
        <a style="cursor:default">{{ulData.title}}</a>
      </li>
      <li v-for="row in ulData.contentArr">
        <a href={{row.url}} target="_blank">
          {{row.title}}
          <template v-if="row.memo">
            <br>
            {{row.memo}}
          </template>
        </a>
      </li>
    </ul>
    <p v-else>loading...</p>'

vm = new Vue
  el: '#app'
  data: 
    project: null
    resume: null
    others: null
  # asyncComputed:
  #   title: ->
  #     ret = 'aaa'
  #     $.getJSON 'http://115.28.21.133:3000/project', (data) -> ret = data.title
  #     ret


  ready: ->
    console.log 'v8'
    # vm = @ 
    $.getJSON 'http://115.28.21.133:3000/project', (data) -> vm.$data.project = data
    $.getJSON 'http://115.28.21.133:3000/resume', (data) -> vm.$data.resume = data
    $.getJSON 'http://115.28.21.133:3000/others', (data) -> vm.$data.others = data

  

