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
package  de.flashforum.ffk10.mvc.service
{

    import de.flashforum.ffk10.mvc.model.IMedia;

    import flash.events.EventDispatcher;

    [Event(name="complete",type="flash.events.Event")]

    public class StreamingService extends EventDispatcher implements IService
    {

        //---------------------------------------------------------------------
        //
        //          Properties
        //
        //---------------------------------------------------------------------

        public function get lastResult():IMedia
        {
            return null;
        }

        //---------------------------------------------------------------------
        //
        //          Constructor
        //
        //---------------------------------------------------------------------

        public function StreamingService()
        {
            super();
        }

        //---------------------------------------------------------------------
        //
        //          Methods
        //
        //---------------------------------------------------------------------

        public function loadMedia(uri:String):void
        {
        }
    }
}