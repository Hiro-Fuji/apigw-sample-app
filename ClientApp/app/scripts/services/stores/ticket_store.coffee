### 
 Copyright 2015 NTT Communications Corportation, https://developer.ntt.com/

 Licensed to the Apache Software Foundation (ASF) under one or more
 contributor license agreements.  See the NOTICE file distributed with
 this work for additional information regarding copyright ownership.
 The ASF licenses this file to You under the Apache License, Version 2.0
 (the "License"); you may not use this file except in compliance with
 the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
### 
'use strict'

###*
 # @ngdoc service
 # @name nttcomApiGatewayWebappApp.ticketStore
 # @description
 # # ticketStore
 # Service in the nttcomApiGatewayWebappApp.
###
angular.module 'nttcomApiGatewayWebappApp'
  .service 'ticketStore',
  [ 'apiClient', 'serviceFilter', 'serviceSortOrderFilter',
  (apiClient, serviceFilter, serviceSortOrderFilter) ->
    _tickets = {}
    {
      # 強制的に当該サービスのチケット一覧をリクエストする
      request: (service, success, failure) ->
        apiClient.getTickets service.requestKey, (items) =>
          # (UNOの場合に)特定サービスだけ抽出
          serviceFilteredItems = serviceFilter items, service
          sortedItems = serviceSortOrderFilter serviceFilteredItems, service.troubleStatusSortOrder, 'troubleStatus'
          _tickets[service.key] = sortedItems
          success sortedItems
        , failure

      # 当該サービスのチケット一覧が無い場合はリクエストを行う
      get: (service, success, failure) ->
        tickets = _tickets[service.key]
        if tickets?
          success tickets
        else
          this.request service, success, failure
    }
  ]
