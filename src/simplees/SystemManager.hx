package simplees;


@:autoBuild(simplees.AddSystemMacro.replaceMetas())
class SystemManager
{
    var em:EntityManager;

    public function new(entityCreator:Class<Dynamic>)
    {
        em = new EntityManager();
        Reflect.setField(entityCreator, "EM", em);
    }

    function addSystem<T>(systemClass:Class<T>):T
    {
        var system:T = Type.createInstance(systemClass, []);
        Reflect.setField(system, "em", em);

        return system;
    }
}