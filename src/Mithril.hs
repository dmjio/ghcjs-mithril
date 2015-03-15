{-# LANGUAGE ForeignFunctionInterface, JavaScriptFFI, CPP #-}
module Mithril where

------------------------------------------------------------------------------
import GHCJS.Types
import GHCJS.DOM.Types
import GHCJS.Foreign
import Control.Concurrent.MVar
------------------------------------------------------------------------------

data Mithril_
data VirtualElement_

type Mithril = JSRef Mithril_
type VirtualElement = JSRef VirtualElement_

foreign import javascript unsafe "m.render($1,$2)" mRender :: Element -> VirtualElement -> IO ()
foreign import javascript unsafe "m($1,$2)" m :: JSString -> JSString -> IO VirtualElement
foreign import javascript unsafe "document.body" body :: IO Element

-- m
  -- VirtualElement m(String selector [, Attributes attributes] [, Children... children])
  --  where:
  --    VirtualElement :: Object { String tag, Attributes attributes, Children children }
  --    Attributes :: Object<any | void config(DOMElement element, Boolean isInitialized, Object context)>
  --    Children :: String text | VirtualElement virtualElement | SubtreeDirective directive | Array<Children children>
  --    SubtreeDirective :: Object { String subtree }

-- m.module
  -- Object module(DOMElement rootElement, Module module)
  --   where:
  --     Module :: Object { Controller, void view(Object controllerInstance) }
  --     Controller :: void controller() | void controller() { prototype: void unload(UnloadEvent e) }
  --     UnloadEvent :: Object {void preventDefault()}

-- m.prop
  -- GetterSetter prop([any initialValue])
  --   where:
  --    GetterSetter :: any getterSetter([any value])

-- m.withAttr
  -- EventHandler withAttr(String property, void callback(any value))
  --   where:
  --     EventHandler :: void handler(Event e)

-- m.route
  -- void route(DOMElement rootElement, String defaultRoute, Object<Module> routes) { String mode, String param(String key) }
  -- where:
  --   Module :: Object { void controller(), void view(Object controllerInstance) }
  -- or: void route(String path [, any params])
  -- or: String route()
  -- or: void route(DOMElement element, Boolean isInitialized)

-- m.request
-- m.deferred
-- m.sync
-- m.trust

-- m.render
  -- void render(DOMElement rootElement, Children children [, Boolean forceRecreation])
     -- where:
     --   Children :: String text | VirtualElement virtualElement | SubtreeDirective directive | Array<Children children>
     --   VirtualElement :: Object { String tag, Attributes attributes, Children children }
     --   Attributes :: Object<Any | void config(DOMElement element)>
     --   SubtreeDirective :: Object { String subtree }

-- m.redraw
-- m.startComputation
-- m.endComputation
-- m.deps
