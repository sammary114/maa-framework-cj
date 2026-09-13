package maa.types

public class MaaMsg {
    // Resource loading
    public static let ResourceLoadingStarting: String = "Resource.Loading.Starting"
    public static let ResourceLoadingSucceeded: String = "Resource.Loading.Succeeded"
    public static let ResourceLoadingFailed: String = "Resource.Loading.Failed"

    // Controller actions
    public static let ControllerActionStarting: String = "Controller.Action.Starting"
    public static let ControllerActionSucceeded: String = "Controller.Action.Succeeded"
    public static let ControllerActionFailed: String = "Controller.Action.Failed"

    // Tasker tasks
    public static let TaskerTaskStarting: String = "Tasker.Task.Starting"
    public static let TaskerTaskSucceeded: String = "Tasker.Task.Succeeded"
    public static let TaskerTaskFailed: String = "Tasker.Task.Failed"

    // Pipeline nodes
    public static let NodePipelineNodeStarting: String = "Node.PipelineNode.Starting"
    public static let NodePipelineNodeSucceeded: String = "Node.PipelineNode.Succeeded"
    public static let NodePipelineNodeFailed: String = "Node.PipelineNode.Failed"

    // Recognition nodes
    public static let NodeRecognitionNodeStarting: String = "Node.RecognitionNode.Starting"
    public static let NodeRecognitionNodeSucceeded: String = "Node.RecognitionNode.Succeeded"
    public static let NodeRecognitionNodeFailed: String = "Node.RecognitionNode.Failed"

    // Action nodes
    public static let NodeActionNodeStarting: String = "Node.ActionNode.Starting"
    public static let NodeActionNodeSucceeded: String = "Node.ActionNode.Succeeded"
    public static let NodeActionNodeFailed: String = "Node.ActionNode.Failed"

    // Next list
    public static let NodeNextListStarting: String = "Node.NextList.Starting"
    public static let NodeNextListSucceeded: String = "Node.NextList.Succeeded"
    public static let NodeNextListFailed: String = "Node.NextList.Failed"

    // Recognition
    public static let NodeRecognitionStarting: String = "Node.Recognition.Starting"
    public static let NodeRecognitionSucceeded: String = "Node.Recognition.Succeeded"
    public static let NodeRecognitionFailed: String = "Node.Recognition.Failed"

    // Action
    public static let NodeActionStarting: String = "Node.Action.Starting"
    public static let NodeActionSucceeded: String = "Node.Action.Succeeded"
    public static let NodeActionFailed: String = "Node.Action.Failed"

    // Wait Freezes
    public static let NodeWaitFreezesStarting: String = "Node.WaitFreezes.Starting"
    public static let NodeWaitFreezesSucceeded: String = "Node.WaitFreezes.Succeeded"
    public static let NodeWaitFreezesFailed: String = "Node.WaitFreezes.Failed"
}
