/*
 * Copyright 2010 Florian Salihovic
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package  de.flashforum.ffk10.mvc.controller
{

    import de.flashforum.ffk10.mvc.model.PlayList;
    import de.flashforum.ffk10.mvc.service.DataLoader;

    import flash.events.Event;

    import spark.components.Application;

    public class ApplicationController
    {

        //---------------------------------------------------------------------
        //
        //          Properties
        //
        //---------------------------------------------------------------------

        private var _application:Application;

        private var _dataLoader:DataLoader;

        private var _inputController:InputController;

        private var _outputController:OutputController;

        private var _playlist:PlayList;

        //---------------------------------------------------------------------
        //
        //          Constructor
        //
        //---------------------------------------------------------------------

        public function ApplicationController(application:Application)
        {
            _application = application;
            initialize();
        }

        //---------------------------------------------------------------------
        //
        //          Methods
        //
        //---------------------------------------------------------------------

        private function getData():void
        {
            _dataLoader = new DataLoader();
            _dataLoader.addEventListener("complete", onCompleteHandler);
            _dataLoader.loadMedia("Settings.xml");
        }

        private function initialize():void
        {
            _outputController = new OutputController();
            _inputController = new InputController();

            getData();
        }

        //---------------------------------------------------------------------
        //
        //          Event Handler
        //
        //---------------------------------------------------------------------

        private function onCompleteHandler(event:Event):void
        {
            _playlist = _dataLoader.lastResult;
        }
    }
}