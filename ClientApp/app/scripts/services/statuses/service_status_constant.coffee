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
 # @name nttcomApiGatewayWebappApp.statuses/serviceStatusConstant
 # @description
 # # statuses/serviceStatusConstant
 # Constant in the nttcomApiGatewayWebappApp.
###
angular.module 'nttcomApiGatewayWebappApp'
  .constant 'serviceStatusConstant',

    # デフォルト値のみ
    "__DEFAULT__":
      data: [
        { value: "1", label: "正常",   icon: 'normal' }
        { value: "2", label: "異常",   icon: 'error' }
        { value: "3", label: "警告",   icon: 'warning' }
        { value: "9", label: "非監視", icon: 'muted' }
      ]
      sortOrder: ['2', '3', '9', '1']
