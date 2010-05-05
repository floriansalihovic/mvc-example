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
package de.flashforum.ffk10.mvc.service
{

    import de.flashforum.ffk10.mvc.model.GenericMedia;
    import de.flashforum.ffk10.mvc.model.IMedia;
    import de.flashforum.ffk10.mvc.model.PlayList;

    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.net.URLLoader;
    import flash.net.URLRequest;

    import mx.collections.ArrayCollection;

    [Event(name="complete",type="flash.events.Event")]

    public class DataLoader extends EventDispatcher
    {

        //---------------------------------------------------------------------
        //
        //          Properties
        //
        //---------------------------------------------------------------------

        private var _lastResult:PlayList;

        public function get lastResult():PlayList
        {
            return _lastResult;
        }

        private var _urlLoader:URLLoader;

        //---------------------------------------------------------------------
        //
        //          Constructor
        //
        //---------------------------------------------------------------------

        public function DataLoader()
        {
            super();
            _urlLoader = new URLLoader();
        }

        //---------------------------------------------------------------------
        //
        //          Methods
        //
        //---------------------------------------------------------------------

        public function loadMedia(uri:String):void
        {
            var _urlRequest:URLRequest = new URLRequest(uri);
            _urlLoader.addEventListener(Event.COMPLETE, onCompleteHandler);
            _urlLoader.load(_urlRequest);
        }

        private function parse(xml:XML):PlayList
        {
            var list:PlayList = new PlayList();
            list.items = new ArrayCollection();

            var media:IMedia;
            for each(var i:XML in xml.item)
            {
                media = new GenericMedia();
                media.type = i.type;
                media.url = i.url;
                media.label = i.label;

                list.items.addItem(media)
            }

            return list;
        }

        //---------------------------------------------------------------------
        //
        //          Event Handler
        //
        //---------------------------------------------------------------------

        private function onCompleteHandler(event:Event):void
        {
            _urlLoader.removeEventListener(Event.COMPLETE, onCompleteHandler);

            var xml:XML = new XML(_urlLoader.data);
            _lastResult = parse(xml);

            dispatchEvent(event.clone());
        }
    }
}