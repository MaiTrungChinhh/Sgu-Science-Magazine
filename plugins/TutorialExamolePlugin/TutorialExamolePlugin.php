<?php
class TutorialExamplePlugin extends GenericPlugin
{
    public function getDisplayName()
    {
        // Implement the method logic here
    }

    public function getDescription()
    {
        // Implement the method logic here
    }
    public function register($category, $path, $mainContextId = null)
    {
        $success = parent::register($category, $path, $mainContextId);
        if ($success && $this->getEnabled()) {
            HookRegistry::register('LoadHandler', array($this, 'setPageHandler'));
        }
        return $success;
    }
    public function setPageHandler($hookName, $params)
    {
        $page = $params[0];
        if ($page === 'tutorialexample') {
            $this->import('TutorialExamplePluginHandler');
            define('HANDLER_CLASS', 'TutorialExamplePluginHandler');
            return true;
        }
        return false;
    }
}