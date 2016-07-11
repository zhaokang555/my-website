Vue.component 'zk-ul-comp', {
  props: ['ulData']
  template: 
    '<ul v-if="ulData" class="nav nav-pills nav-stacked">
      <li class="active">
        <a style="cursor:default" href="##">{{ulData.title}}</a>
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
    <h2 v-else>loading...</h2>'
}

new Vue(
  el: '#app'
  data: 
    project: null
    resume: null
    others: null

  ready: ->
    console.log 'v3'
    me = this # 这里不能用 me = @, 因为在vue中，this代理了this.data的properties, 而@没有。this.resume 相当于 @data.resume
    $.getJSON 'http://115.28.21.133:3000/project', (data) -> me.project = data
    $.getJSON 'http://115.28.21.133:3000/resume', (data) -> me.resume = data
    $.getJSON 'http://115.28.21.133:3000/others', (data) -> me.others = data
)
  

