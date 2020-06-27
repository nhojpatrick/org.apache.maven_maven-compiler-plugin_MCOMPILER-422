module workaround.service.implementation {
    exports tld.example.implementation;
    provides tld.example.interfaces.ExampleService
            with tld.example.implementation.ExampleServiceImpl;
    requires workaround.service.interfaces;
    requires org.apache.commons.lang3;
    requires org.slf4j;
}