package simplees;


@:autoBuild(simplees.AddSystemMacro.replaceMetas())
class SystemManager
{
	var enh:EntityManager;

	public function new(entityCreator:Class<Dynamic>)
	{
		enh = new EntityManager();
		Reflect.setField(entityCreator, "EM", enh);
	}

    function addSystem<T>(systemClass:Class<T>):T
    {
        var system:T = Type.createInstance(systemClass, []);
        Reflect.setField(system, "em", enh);

        return system;
    }
}